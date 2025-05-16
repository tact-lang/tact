struct Inner { a: Int; b: Bool; c: String; }

struct Wrap { one: Inner; two: Inner; label: String; }

contract DupeStructs {
 val: Wrap;

 init() {
  self.val = Wrap{
    one: Inner{ a:1,b:true,c:"x" },
    two: Inner{ a:2,b:false,c:"y" },
    label: "lbl"
  };
 }
}