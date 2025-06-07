contract TestConditionalExpression {
    receive() {
         let res: Int = (2 + 2 == 4) ? 100 : 200;
         dump(res);
    }
}
