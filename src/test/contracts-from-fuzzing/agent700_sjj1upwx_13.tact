struct SingleOptional { val: Int? }

contract OptionalStructField {
    s: SingleOptional;
  
    init() {
      self.s = SingleOptional{ val: null };
    }
}