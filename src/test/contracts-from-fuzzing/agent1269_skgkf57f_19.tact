struct NestedDefaults {
   inner: InnerDefaults;
}

struct InnerDefaults {
   x: Int = 1;
   y: String = "foo";
   z: Bool?;
}

contract DefaultsDeepTest {
   val: NestedDefaults;
   init() {
       self.val = NestedDefaults{
          inner: InnerDefaults{
             x: 100,
             y: "bar",
             z: null,
          },
       };
   }
}
