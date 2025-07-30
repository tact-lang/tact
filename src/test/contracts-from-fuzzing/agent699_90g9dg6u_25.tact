struct InnerMost { val:Int; }
struct Inner { one:InnerMost; two:InnerMost; }
struct Middle { a:Inner; b:Inner; str:String; }
struct Upper { m:Middle; flag:Bool; opt:Int?; }

contract DeepShape {
    state: Upper;
    init() {
      self.state = Upper{
        m:Middle{
          a:Inner{
            one:InnerMost{val:1}, two:InnerMost{val:2}
          },
          b:Inner{
            one:InnerMost{val:3}, two:InnerMost{val:4}
          },
          str:"hello"
        },
        flag:true,
        opt:null
      };
    }
}