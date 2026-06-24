// test reordering nested optional and default fields
struct Countries {
  name: String;
  capital: String?;
  population: Int = 0;
  gdp: Int?;
}

contract GeoData {
  data: Countries;

  init() {
    self.data = Countries{
      name: "Neverland",
      capital: null,
      gdp: null
    };
  }
}
