struct DeepStruct1 {
  x: Int;
  y: Bool;
}

struct DeepStruct2 {
  inner: DeepStruct1;
}

struct DeepStruct3 {
  inner: DeepStruct2;
}

struct DeepStruct4 {
  inner: DeepStruct3;
}

struct DeepStruct5 {
  inner: DeepStruct4;
}

contract DeepChain {
  data: DeepStruct5;

  init() {
    self.data = DeepStruct5{
      inner: DeepStruct4{
        inner: DeepStruct3{
          inner: DeepStruct2{
            inner: DeepStruct1{
              x: 123,
              y: true,
            },
          },
        },
      },
    };
  }
}