struct Point {
  x: Int;
  y: Int;
}

struct Person {
  name: String;
  age: Int?;
  home: Point;
}

contract OptionalAndNestedFields {
  pers: Person;

  init() {
    self.pers = Person{
      name: "Alice",
      age: null,
      home: Point{x: 0, y: 0}
    };
  }
}