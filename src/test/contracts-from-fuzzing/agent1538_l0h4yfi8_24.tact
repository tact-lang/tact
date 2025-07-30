struct SAlpha { p: Int } 
struct SBeta { p: Int }

contract SameNameNested {
  alpha: SAlpha;
  beta: SBeta;

  init() {
    self.alpha = SAlpha{p: 1};
    self.beta = SBeta{p: 2};
  }
}