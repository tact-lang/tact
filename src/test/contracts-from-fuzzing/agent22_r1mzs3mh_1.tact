contract Simple {
    get fun addr(): Address {
       return contractAddress(initOf Simple());
    }
}