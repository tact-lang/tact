contract TernaryTestValid {
    receive() {
         let a: Int = false ? 1 : true ? 2 : 3;
         dump(a);
    }
}
