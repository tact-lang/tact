struct ManyDefaults {
    a:Int=0;
    b:Int=1;
    c:Int=2;
    d:Int=3;
    e:Int=4;
}
contract ManyDefaultsTest {
    f:ManyDefaults;
    init(){
        self.f=ManyDefaults{};
    }
}