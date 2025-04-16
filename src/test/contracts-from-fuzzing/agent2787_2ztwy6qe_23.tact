struct Leaf {
  v: Int;
}

contract DefaultsTest {
  val: Int = 0;
  flag: Bool = false;
  txt: String = "";
  leaf: Leaf = Leaf{v:42};
  
  init() {
    self.val = 7;
    self.flag = true;
    self.txt = "Hi";
    self.leaf = Leaf{v:100};
  }
}
