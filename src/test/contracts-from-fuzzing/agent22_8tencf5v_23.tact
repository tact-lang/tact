// Large number of primitive persistent fields with default values specified inline
contract DefaultsPrimitives {
    a:Int = 1; b:Bool = true; c:String = "c";
    d:Int = 2; e:Bool = false; f:String = "f";
    g:Int = 3; h:Bool = true; i:String = "i";
    j:Int = 4; k:Bool = false; l:String = "l";
    m:Int = 5; n:Bool = true; o:String = "o";
    p:Int = 6; q:Bool = false; r:String = "r";

    init() {
        // override some defaults
        self.a=11; self.b=false; self.c="cc";
        self.d=22; self.e=true; self.f="ff";
        self.g=33; self.h=false; self.i="ii";
        self.j=44; self.k=true; self.l="ll";
        self.m=55; self.n=false; self.o="oo";
        self.p=66; self.q=true; self.r="rr";
    }
}