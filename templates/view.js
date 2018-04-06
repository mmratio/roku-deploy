// using a js string since requiring an html file is failing :\
module.exports =`<div class="controls block">
	<div class="block">
		<h3>Select Roku Device as Deploy Target</h3>
		<div class="block">
			<select name="devices" class="form-control devices-select inline-block">
				<option value="None">None</option>
			</select>
			<span class='loading loading-spinner-tiny inline-block'></span>
		</div>
		<p>The selected Roku device ip will be set as the target address for deploy</p>
	</div>
	<div class='block' data-actions>
		 <button data-confirm="true" class='btn icon primary device-desktop inline-block-tight'>Confirm Roku Selection</button>
		 <button class='btn icon x inline-block-tight'>Cancel</button>
	</div>
</div>`
