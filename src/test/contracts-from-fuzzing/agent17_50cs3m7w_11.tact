contract TestLocalConstants2 {
    const MY_CONST: Int = 2023;
    
    receive() {
        let dbl: Int = self.MY_CONST + self.MY_CONST;
    }
}
