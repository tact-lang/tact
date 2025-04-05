message Multiple {
   x: Int;
   y: Int;
}

contract Test {
   receive(m: Multiple) {
     let z = m.x + m.y;
   }
}