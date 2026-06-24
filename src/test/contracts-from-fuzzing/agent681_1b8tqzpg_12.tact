struct DeepOne {
  n: Int;
}

struct DeepTwo {
  deep: DeepOne;
}

struct DeepThree {
  deep: DeepTwo;
}

struct DeepFour {
  deep: DeepThree;
}

struct DeepFive {
  deep: DeepFour;
}

contract DeepChain {
  chain: DeepFive;

  init() {
    self.chain = DeepFive{
      deep: DeepFour{
        deep: DeepThree{
          deep: DeepTwo{
            deep: DeepOne{ n: 100 }
          }
        }
      }
    };
  }
}