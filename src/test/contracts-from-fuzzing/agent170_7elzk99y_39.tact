// deeply nested combination: optional message nested in optional struct
message(0x21) M21 { val: Int }

struct InnerOpt {
 m: M21?;
}

struct OuterOpt {
 inner: InnerOpt?;
}

contract DeepNestedCombo {
 data: OuterOpt;

 init() {
   self.data = OuterOpt{ inner: InnerOpt{ m: null } };
 }
}