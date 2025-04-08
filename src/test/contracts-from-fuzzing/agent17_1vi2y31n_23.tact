struct SLeaf { b: Bool }
struct SBranch { leaf1: SLeaf; leaf2: SLeaf }
struct SRoot { branch: SBranch }

contract TreeStruct {
  root: SRoot;

  init() {
    self.root = SRoot{
      branch: SBranch{
        leaf1: SLeaf{b:true},
        leaf2: SLeaf{b:false}
      }
    };
  }
}