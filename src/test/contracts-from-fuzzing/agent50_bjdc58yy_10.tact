contract TestTypeCoercion {
    receive() {
        let i: Int = 261119911;
        let coins: String = i.toCoinsString();
        dump(coins); // expect to see "0.261119911" based on documentation
    }
}
