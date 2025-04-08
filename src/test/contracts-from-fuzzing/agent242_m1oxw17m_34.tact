struct InnerMostOpt {
 a: Int?;
}
struct MidOpt {
 inner: InnerMostOpt?;
}
contract DeepOptChain {
 top: MidOpt?;
 init() {
   self.top = MidOpt{
     inner: InnerMostOpt{ a: null },
   };
 }
}