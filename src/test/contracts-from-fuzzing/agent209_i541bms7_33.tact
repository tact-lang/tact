// Contract large optional chain with default nulls
struct Step4 { v: Bool?; }
struct Step3 { s4: Step4?; }
struct Step2 { s3: Step3?; }
struct Step1 { s2: Step2?; }

contract OptionChain {
  optchain: Step1;

  init() {
    self.optchain = Step1{
      s2: null
    };
  }
}