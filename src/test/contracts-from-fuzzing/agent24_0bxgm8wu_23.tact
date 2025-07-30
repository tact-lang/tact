contract TestThrowOutsideTry {
    receive() {
         // Testing throwing outside of a try block
         throw(123);
    }
}
