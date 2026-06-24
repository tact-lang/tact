contract TestBooleanLiteral {
    receive() {
         let b: Bool = true;
         dump(b);
         dump(!b);
    }
}
