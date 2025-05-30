struct StrIntBool {
    s: String;
    i: Int;
    b: Bool;
}

contract DefaultStructInit {
    val: StrIntBool = StrIntBool{s:"hello",i:42,b:true};
    receive() {
        let _ = self.val.b;
    }
}