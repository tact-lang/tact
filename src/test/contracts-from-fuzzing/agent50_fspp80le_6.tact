contract BoolTest {
    const FLAG: Bool = false;

    get fun getFlag(): Bool {
        return self.FLAG;
    }
}
