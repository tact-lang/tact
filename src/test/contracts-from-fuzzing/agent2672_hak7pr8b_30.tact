struct InnerMost { a: Int; b: Bool; }

struct Middle { c: InnerMost; d: Int; }

struct OuterMost { e: Middle; f: String; }

contract DeeplyNestedStructs {
 data: OuterMost;
 init() {
   self.data = OuterMost{
     e: Middle {
       c: InnerMost{ a:1, b:true },
       d:42
     },
     f: "nested"
   };
 }
}