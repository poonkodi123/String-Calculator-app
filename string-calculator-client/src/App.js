import React, { useState } from 'react';
import axios from 'axios';
import './App.css'


function App() {
  const [input, setInput] = useState('');
  const [result, setResult] = useState('');
  const [error, setError] = useState('');

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      const response = await axios.post('http://localhost:3000/api/v1/calculate', {
        numbers: input
      });
      setResult(response.data.result);
      setError('');
    } catch (err) {
      setError(err.response?.data.error || 'An error occurred');
      setResult('');
    }
  };

  return (
    <div className="calculator">
  <div style={{ padding: '20px' }}>
      <form onSubmit={handleSubmit}>
        
        <input
          type="text"
          value={input}
          onChange={(e) => setInput(e.target.value)}
          placeholder="Enter numbers (e.g., 1,2,3)"
          style={{ marginRight: '10px', padding: '5px' }}
        />
        <button type="submit" className="display">Calculate Sum</button>
      </form>
      {result !== '' && <div style={{ marginTop: '10px' }}>Result: {result}</div>}
      {error && <div style={{ marginTop: '10px', color: 'red' }}>Error: {error}</div>}
     </div>      
      <div className="examples-section">
        <h3>Valid Input Examples:</h3>
        <ul>
          <li>Empty input: "" (returns 0)</li>
          <li>Single number: "5"</li>
          <li>Multiple numbers: "1,2,3"</li>
          <li>Newline delimiter: "1\n2,3"</li>
          <li>Custom delimiter: "//;\n1;2"</li>
          <li>Multi-char delimiter: "//[***]\n1***2***3"</li>
        </ul>
      </div>
    </div>

    
  );
}

export default App;
