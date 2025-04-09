contract TestTernary {
    receive() {
         let result = (10 > 5) ? 100 : 200;
         dump(result);
    }
}
