contract TestOptional {
    receive() {
         let maybe: Int? = 123;
         let sure = maybe!!;
         dump(sure);
    }
}
