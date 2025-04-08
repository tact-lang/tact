// Edge case involving many optional nested booleans
struct OptBoolLevel3 { val: Bool?; }
struct OptBoolLevel2 { nested: OptBoolLevel3?; }
struct OptBoolLevel1 { nested: OptBoolLevel2?; }

contract DeepOptBool {
  opt: OptBoolLevel1;

  init() {
    self.opt = OptBoolLevel1{
      nested: OptBoolLevel2{
        nested: OptBoolLevel3{
          val: true
        }
      }
    };
  }
}