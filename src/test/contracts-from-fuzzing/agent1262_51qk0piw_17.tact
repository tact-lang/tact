struct SVal {
  x: Int;
  y: Bool;
  z: String;
}

contract ManyStructOneVar {
  s: SVal = SVal{x: 1, y: false, z: "hi"};
}