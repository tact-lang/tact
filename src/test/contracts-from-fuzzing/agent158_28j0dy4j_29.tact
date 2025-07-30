struct Inner {x:Int;y:Int}
struct Wrap { inner:Inner; extra:String? }

contract StructOptWrap {
  s:Wrap;
  init() {
    self.s = Wrap{
      inner: Inner{ x:1,y:2 },
      extra: null
    };
  }
}