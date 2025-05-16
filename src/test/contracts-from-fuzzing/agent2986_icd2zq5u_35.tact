// large struct default vals nested optional
struct InnerLargeDefault {
    x:Int=0; y:Int=1; z:Int=2; a:Bool=true; b:Bool=false; s:String="";
}

contract OptLargeDefault {
    f: InnerLargeDefault?;

    init() {
        self.f = null;
    }
}