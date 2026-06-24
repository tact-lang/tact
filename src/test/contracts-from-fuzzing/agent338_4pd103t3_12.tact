struct Blob {
  content: String?;
  raw: Cell?;
}

struct Container {
  blob: Blob?;
  tag: String;
}

contract TestContract {
  archive: Container;

  init() {
    self.archive = Container{
      blob: null,
      tag: "empty"
    };
  }
}