struct InnerOpt {
 x:Int? = null;
}

contract DefaultOpt {
 val:InnerOpt;
 init() {
  self.val = InnerOpt{};
 }
}