contract Test {
    receive() {
         // Let statement with type inference
         let a = 123;
         dump(a);
    }
}
