struct S {
    s: String;
}

contract TestStruct {
    receive() {
        // Correct instantiation syntax for struct as per Tact docs 
        let obj: S = S{ s: "Test in struct" };
        let _ = obj.s.asSlice();
    }
}
