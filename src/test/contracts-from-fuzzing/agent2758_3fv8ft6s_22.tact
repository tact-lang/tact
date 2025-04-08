struct Edge {
  x: Int;
  y: Int;
  label: String;
  flag: Bool?;
}

contract TestContract {
  first: Edge;
  second: Edge;

  init() {
    self.first = Edge{ x:1, y:2, label:"A", flag:true };
    self.second = Edge{ x:3, y:4, label:"B", flag:null };
  }
}