contract TestComplexBoolOps {
    receive() {
         let res: Bool = (true || false) && (false || true); // expected true
         dump(res);
    }
}
