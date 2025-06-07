struct MostlyDefaults {
    a:Int=1;
    b:Bool=false;
    c:String="foo";
    d:Int=42;
    e:Bool=true;
    f:String="bar";
}
contract DefaultsState {
    state: MostlyDefaults;
    init() {
        self.state = MostlyDefaults{a:1,b:false,c:"foo",d:42,e:true,f:"bar"};
    }
}