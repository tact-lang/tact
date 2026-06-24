struct Person {
  name: String;
  age: Int;
  married: Bool;
  nickname: String?;
}

contract PersonStore {
  val: Person;

  init() {
    self.val = Person{
      name: "Alex",
      age: 30,
      married: false,
      nickname: null,
    };
  }
}