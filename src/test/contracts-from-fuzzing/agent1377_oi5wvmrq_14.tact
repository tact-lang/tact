struct Point {
  x: Int;
  y: Int;
}

struct Person {
  name: String;
  age: Int;
}

struct Thing {
  id: Int;
  pos: Point;
  owner: Person;
}

contract TestContract {
  item1: Thing;
  item2: Thing;

  init() {
    self.item1 = Thing{id:1, pos:Point{x:10,y:20}, owner:Person{name:"Alice", age:33}};
    self.item2 = Thing{id:2, pos:Point{x:30,y:40}, owner:Person{name:"Bob", age:44}};
  }
}