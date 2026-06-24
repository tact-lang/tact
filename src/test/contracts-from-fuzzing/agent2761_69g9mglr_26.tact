struct InnerMost6 { f: Int; }
struct Inner6 { innerMost: InnerMost6; }
struct Medium6 { inner: Inner6; }
struct Outer6 { medium: Medium6; }
contract DeepWrap6 {
 data: Outer6;
 init(){
  self.data = Outer6{
   medium: Medium6{ inner: Inner6{ innerMost: InnerMost6{ f: 42 } } }
  };
 }
}
