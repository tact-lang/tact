contract TestBoolOps {
    receive() {
         let a: Bool = false;
         let b: Bool = true;
         let c: Bool = a && b;  // expected false
         let d: Bool = a || b;  // expected true
         dump(c);
         dump(d);
    }
}
