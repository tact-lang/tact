contract TestLogicalNot {
    receive() {
         let a: Bool = !false;
         dump(a);
    }
}
