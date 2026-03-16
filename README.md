# OSCountryPicker 🌍

A lightweight and customizable **country picker for iOS** built with
Swift.\
`OSCountryPicker` allows users to easily select a country along with
useful metadata such as **country code, flag, and dialing code**.

It is designed to be simple to integrate, easy to customize, and
performant even with large country lists.

------------------------------------------------------------------------

## ✨ Features

-   🌎 List of all countries with flags
-   🔎 Built‑in search support
-   📱 Optimized for iOS UI/UX
-   🎨 Easily customizable UI
-   📦 Lightweight and dependency‑free
-   ⚡ Fast and smooth scrolling
-   🧩 Simple integration into existing projects

------------------------------------------------------------------------

## 📦 Installation

### Swift Package Manager

1.  Open your project in **Xcode**
2.  Go to\
    `File` → `Add Packages`
3.  Enter the repository URL:

```{=html}
<!-- -->
```
    https://github.com/Omeesh/OSCountryPicker

4.  Add the package to your target.

------------------------------------------------------------------------

## 🚀 Usage

### Import

``` swift
import OSCountryPicker
```

### Present the Country Picker

``` swift
let picker = OSCountryPicker()

picker.onCountrySelected = { country in
    print("Country: \(country.name)")
    print("Code: \(country.code)")
    print("Dial Code: \(country.dialCode)")
}

present(picker, animated: true)
```

------------------------------------------------------------------------

## 📊 Country Model Example

``` swift
struct Country {
    let name: String
    let code: String
    let dialCode: String
    let flag: String
}
```

Example output:

    Country: India
    Code: IN
    Dial Code: +91

------------------------------------------------------------------------

## 🎨 Customization

You can customize the picker appearance:

-   Cell UI
-   Flag size
-   Search behavior
-   Country filtering
-   Default selected country

Example:

``` swift
picker.defaultCountryCode = "US"
picker.showDialCode = true
picker.showFlags = true
```

------------------------------------------------------------------------

## 🧪 Example Project

Clone the repository and run the example project to see the picker in
action.

``` bash
git clone https://github.com/Omeesh/OSCountryPicker.git
```

------------------------------------------------------------------------

## 🤝 Contributing

Contributions are welcome!

If you have ideas for improvements:

1.  Fork the repo
2.  Create a feature branch
3.  Submit a Pull Request

------------------------------------------------------------------------

## 📄 License

This project is licensed under the **MIT License**.

------------------------------------------------------------------------

## 👨‍💻 Author

Created by **Omeesh Sharma**

GitHub:\
https://github.com/Omeesh

------------------------------------------------------------------------

⭐ If you find this project useful, consider **starring the
repository**.
