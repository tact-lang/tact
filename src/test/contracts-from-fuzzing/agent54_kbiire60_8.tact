contract TestOptional {
    receive() {
         // Test optional variable and non-null assertion operator (!!)
         let maybe: Int? = 123;
         let a: Int = maybe!!;
         dump(a);
    }
}
