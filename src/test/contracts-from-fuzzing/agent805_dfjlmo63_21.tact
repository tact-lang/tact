struct OneMoreWrap {
  deep: DeepLevel;
}

struct DeepLevel {
  inner: Int;
}

contract InnerStructInField {
  data: OneMoreWrap;

  init() {
    self.data = OneMoreWrap{
      deep: DeepLevel{ inner: 777 }
    };
  }
}
