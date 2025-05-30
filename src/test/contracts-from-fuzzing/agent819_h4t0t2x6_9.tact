struct Info {
  desc: String?;
  url: String?;
}

struct Metadata {
  title: String?;
  info: Info?;
}

contract TestContract {
  meta: Metadata;

  init() {
    self.meta = Metadata{
      title: null,
      info: null
    };
  }
}