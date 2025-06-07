struct DeepDiagnose1 { val: Int }
struct DeepDiagnose2 { lvl: DeepDiagnose1 }

contract OptLevelChain {
  level: DeepDiagnose2?;

  init() {
    self.level = null;
  }
}
