contract ParamContract(param: Int) {
    receive() {
         dump(self.param);
    }
}
