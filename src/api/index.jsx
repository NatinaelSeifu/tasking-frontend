import axios from "axios";

const REACT_APP_API_KEY=process.env.REACT_APP_API_KEY;

const api = axios.create({
  baseURL: REACT_APP_API_KEY,
});
export default api;
