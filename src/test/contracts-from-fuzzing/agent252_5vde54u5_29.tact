contract GiantMix {
foo:Int; bar:Bool; baz:Address; qux:Cell; quux:Slice; corge:String;
grault:Int?; garply:Bool?; waldo:Address?; fred:Cell?; plugh:Slice?; xyzzy:String?;
thud:Int = 42;

init() {
  self.foo=1; self.bar=true; self.baz=myAddress(); self.qux=emptyCell(); self.quux=emptyCell().asSlice(); self.corge="str";
  self.grault=null; self.garply=null; self.waldo=null; self.fred=null; self.plugh=null; self.xyzzy=null;
  self.thud=888;
}
}