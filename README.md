# ERB Templates: North Pole Writing Machine

[See assignment in Alexa.](https://alexa.bitmaker.co/assignments/2620/latest)


## Exercise One: The Nice Kids
We're going to write letters to all the nice kids.

Fortunately, the nice letter writer has already been written for you.

Take a look at the folder ```letters/nice/```. It should be empty (except for a ```.keep``` file. You'll see this file if you're doing an ls of the folder on the command line, but not if you're using a GUI, as ```.``` files are hidden).

Run the program ```nice_letter_writer.rb```.

Now look at the folder ```letters/nice/```. It should have letters to all the nice kids.

### Our Program
Take a look at these files:
```
templates/nice_letter_template.txt.erb  - nice letter template
data/kids-data.txt                      - data we're using to produce the letters
nice_letter_writer.rb                   - program that creates the letters
```
These three files let us create a few dozen letters to the children. Nice job automating!

### To ```=``` or not to ```=```, that is the question ...
Notice that for some of our ERB tags, we just use ```<% %>``` but for others, we use ```<%= %>``` lines.

The ```<% %>``` is used when we don't want the return value of the code to output to the screen. However the <%= %> is used when we do want to display to return value of the embedded ruby.

Try adding an ```=``` where it's missing and running the program again. What changes happen to your letter?

Now try removing all the ```=```' from the ERB tags. Run the program and check what changes happened again.

To sum up:

- use ```<% %>``` when you just need the code evaluated
- use ```<%= %>``` when you want to display what's evaluated
Fix up nice_letter_template.txt.erb so that only the ERB tags requiring = have them.

### Trimming Lines
On some lines, we're passing the letter and two more arguments into the ERB line:
```
ERB.new(nice_letter, nil, '-')
```
And that some of our embedded ruby tags includes a - as part of the closing erb tag, for example:
```
<% end -%>
```
The last argument ```'-'``` trims this line and ensures it's not included as part of the output. Without this trimming option, our letters would have extra lines.

Try removing all the ```'-''``` from the closing erb tags and running ```nice_letter_writer.rb``` again and see what happens. You should notice extra line breaks.

Fix up ```nice_letter_template.txt.erb``` so that any ERB tags requiring - have them.

## Exercise Two: The Naughty Kids
Just as the nice kids receive kind words from Santa, naughty kids receive letters of scorn.

Create a new program called ```naughty_letter_writer.rb``` that writes letters to all the naughty kids. You can refer to ```nice_letter_writer.rb```.to use as a guide.

Now take a look at ```templates/naughty_letter_sample.txt```. This letter was composed using data from "Zoe" in ```kids-data.txt```.

Copy ```templates/naughty_letter_sample.txt``` to ```naughty_letter_template.txt.erb``` and modify the this new ```.erb``` file to use data from the ```kids-data.txt``` data file.

Each naughty child will only receive one toy they asked for.

You should include each naughty child's infraction. You can obtain this from each line of data by using ```.split``` and splitting each line at the ```|```

For example, you should swap out *"made a campfire in your parent's basement"* with an ERB tag containing the child's infraction.

Naughty letters should be saved to the ```letters/naughty``` folder.

To sum up, the naughty letter should:

- display the child's name
- display the child's infraction
- display one random toy from their list (remember the Kaleidoscope is out of stock, so it can't be this toy)
- display the toys they're not receiving


## Stretch Exercise: Parent's Invoice Letter
Create an invoice letter to be send to each child's parents. Santa bills parents according to their house value.

His billing structure is:

$1000 per toy if the house value is greater than $1,000,000. $100 per toy if the house value is between than $200,000 and $1,000,000. No charge if the house value is less than $200,000.

Parents not being charged (less than $200,000 valued house) should not receive an invoice.

Parents of naughty children should only be billed for "1 defective toy" without the toy the child is receiving being explicitly referenced.

Create ```invoice_letter.txt.erb``` and use the ```invoice_sample_letter.txt``` as the basis.

For the naughty children, add this addendum to the letter:

*P.S. For a limited time get 25% off the best-seller by Ms. Claus, I’m Getting Nothing for Christmas: Raising Toy-Worthy Children in a Device-Driven World.*

Invoice letters should be saved to the ```letters/invoices``` folder.
