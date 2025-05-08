// test contract with large number of persistent primitive fields
contract TestContract {
    a0:Int;  a1:Int;  a2:Int;  a3:Int;  a4:Int;
    a5:Int;  a6:Int;  a7:Int;  a8:Int;  a9:Int;
    b0:Bool; b1:Bool; b2:Bool; b3:Bool; b4:Bool;
    b5:Bool; b6:Bool; b7:Bool; b8:Bool; b9:Bool;

    init() {
        self.a0=0; self.a1=0; self.a2=0; self.a3=0; self.a4=0;
        self.a5=0; self.a6=0; self.a7=0; self.a8=0; self.a9=0;
        self.b0=false; self.b1=false; self.b2=false; self.b3=false; self.b4=false;
        self.b5=false; self.b6=false; self.b7=false; self.b8=false; self.b9=false;
    }
}