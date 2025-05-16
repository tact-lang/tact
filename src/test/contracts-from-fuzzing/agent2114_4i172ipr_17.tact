struct OneLiners { a:Int; b:Int; c:Int }

contract ManyFields {
    f: OneLiners;

    init() {
        self.f = OneLiners{a:1,b:2,c:3};
    }
}
