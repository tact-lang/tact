struct HasOptional {
 a: Int; 
 b: Int?;
}

contract DefaultNullTest {
  data: HasOptional;

  init() {
    self.data = HasOptional{ a: 5, b: null };
  }
}