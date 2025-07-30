message Singleton {}

struct Container {
  m: Singleton;
}

contract TestContract {
  receive() {
    let c: Container = Container{
      m: Singleton{}
    };
  }
}