struct OptBool {
 a: Bool?;
 b: Bool?;
}

contract OptionalBoolTest {
 val: OptBool;

 init() {
   self.val = OptBool{a:null,b:true};
 }
}